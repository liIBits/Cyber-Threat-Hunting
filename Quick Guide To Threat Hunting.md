Quick Guide to Threat Hunting

# Structure and Unstructured Threat Hunts
Structured threat hunts are centered on a hypothesis such as intelligence driven threat hunts. Unstructured threat hunts are catered towards statistics and looking for what’s normal or not normal on the network.
# Threat Hunting Techniques
## Volume Analysis
Looks at the volume of a particular activity in relation to other activities. 
- Often though in terms of Network traffic
- can be applied more broadly to activity on a system
- Number of processes with unusual paths
- Number of particular users’ activity across an environment
- Any other aspect that can be sufficiently measured and visualized
Examples:
- How much data did endpoints send of the network?
- Which endpoint sent the most data?
- What external IP had the greatest number of blocked connections?
- Which systems can the greatest number of blocked connections?
Which systems have had the longest sessions?
What systems have had the most AV alerts?
## Frequency Analysis
Instead of volume, it examines the frequency of an occurrence.
- Most often applied to network traffic at both the network and host levels
- Used to identify anomalous pattern often found in malware beacons.
## Cluster Analysis
A method of statistical analysis.
- Will often look at both network and host-based characteristics
- Clustering will group data around in particular set of characteristics in aggregate
- Often aided by statistical analysis tools
- Can help identify things such as outliers such as uncommon numbers of occurrences of common behaviors.
## Grouping Analysis
Is similar to clustering analysis, but instead of clustering based on an aggregate of carious characteristics, grouping seeks to group the data based on the occurrence of specific simultaneous conditions.
- Can often reveal previously unknown tools or actor behavior
Examples: 
- ** Outbound network source **: this shows host that may be bypassing web content filtering
- ** Domain Name servers **: this will reveal hosts that may be using non-standard DNS servers
## Stacking
An analytical method which can be effectively used against finite data sets and involves aggregating and counting the number of times a condition is observed, with the intent of identifying statistical extremes in either direction
Example: 
- Looking at the directory that key windows files are observed in. This can identify binaries masquerading.
