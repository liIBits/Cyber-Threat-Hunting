`Add-Type -AssemblyName System.Windows.Forms
$fileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ 
    InitialDirectory = [Environment]::GetFolderPath('Desktop') 
    Filter = 'SpreadSheet (*.xlsx)|*.xlsx'
}

Write-Host 'Choose IOC xlsx file.'
Write-Host ''
$null = $FileBrowser.ShowDialog()
$objExcel = New-Object -ComObject Excel.Application
$objExcel.Visible = $false
$workbook = $objExcel.WorkBooks.Open($fileBrowser.FileName)
Write-Host 'Enter number for the worksheet to process then press enter'
$workBook.sheets | Format-Table -Property Index,Name -AutoSize
$chosenWorksheet = Read-Host
$worksheet = $workBook.sheets | where {$_.index -eq $chosenWorksheet}
$rowCount = $worksheet.UsedRange.Rows.Count

$suricataIP = ''
$suricataDomain = ''
$suricataURI = ''
$suricataURL = ''
$count = 1
while($count -le $rowCount)
{
    $sid = 5000000 + $count
    $iocType = $worksheet.Columns.Item(1).Rows.Item($count).Text
    $ioc = $worksheet.Columns.Item(2).Rows.Item($count).Text
    $count ++
    if($iocType.equals('ip-dst')) {
        $suricataIP = $suricataIP + "alert ip $ioc any <> any any (msg:`"Known bad IP " + $ioc + " from 551 Repo`"; sid:$sid; rev:1;)`n"
    }
    elseif($iocType.equals('ip-src')) {
        $suricataIP = $suricataIP + "alert ip $ioc any <> any any (msg:`"Known bad IP " + $ioc + " from 551 Repo`"; sid:$sid; rev:1;)`n"
    }
    elseif($iocType.equals('ip-dst|port')) {
        $ip = $ioc.Split('|')[0]
        $port = $ioc.Split('|')[1]
        $suricataIP = $suricataIP + "alert ip $ip $port <> any any (msg:`"Known bad IP " + $ioc + " from 551 Repo`"; sid:$sid; rev:1;)`n"
    }
    elseif($iocType.equals('ip-src|port')) {
        $ip = $ioc.Split('|')[0]
        $port = $ioc.Split('|')[1]
        $suricataIP = $suricataIP + "alert ip $ip $port <> any any (msg:`"Known bad IP " + $ioc + " from 551 Repo`"; sid:$sid; rev:1;)`n"
    }
    elseif($iocType.equals('domain')) {
        $suricataDomain = $suricataDomain + "alert dns any any -> any any (msg:`"Known bad DNS query " + $ioc + " from 551 Repo`"; dns_query; 
       content:`".$ioc`"; sid:$sid; rev:1;)`n"
    }
    elseif($iocType.equals('domain|ip')) {
        $domain = $ioc.Split('|')[0]
        $ip = $ioc.Split('|')[1]
        $suricataDomain = $suricataDomain + "alert dns any any -> any any (msg:`"Known bad query " + $ioc + " from 551 Repo`"; dns_query; content:`".$domain`"; sid:$sid; rev:1;)`n"
        $suricataIP = $suricataIP + "alert ip $ip any <> any any (msg:`"Known bad IP " + $ioc + " from 551 Repo`"; sid:$sid; rev:1;)`n"
    }
    elseif($iocType.equals('uri')) {
        $suricataURI = $suricataURI + "alert ip any any -> any any (msg:`"Known bad uri " + $ioc + " from 551 Repo`"; content:`"$ioc`"; http_uri; sid:$sid; rev:1;)`n"
    }
    elseif($iocType.equals('url')) {
        $suricataURL = $suricataURL + "alert http any any -> any any (msg:`"Known bad URL " + $ioc + " from 551 Repo`"; content:`"$ioc`"; http_method; sid:$sid; rev:1;)`n"
    }
    Write-Host $count "out of" $rowCount "complete"

}

$objExcel.Workbooks.Close() #Close Workbook
$objExcel.Quit(); # Quit Excel Object
# Get the latest or highest Excel Process ID
$Process_ID = Get-Process Excel | Sort-Object Id -Desc | Select-Object -First 1 | %{$_.Id};
# Kill Excel By Process ID
Stop-Process -ID $Process_ID 2>$NULL;
Add-Content SuricataRules.txt $suricataIP
Add-Content SuricataRules.txt $suricataDomain
Add-Content SuricataRules.txt $suricataURI
Add-Content SuricataRules.txt $suricataURL`
