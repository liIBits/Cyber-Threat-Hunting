I will provide information on intel-driven threat hunts since that is what I'm experience in.

# Utilize Inteligence

## Which APT's are going to be incorporated into the threat hunt?
Discern what type of network the threat hunt will occur on (Hybrid, Cloud, ICS/SCADA, SIPR, etc.)
- Find at least 3 that can be potentially found on the network

# Create a Baseline plan
Figure out what is normal by spending time to analyze the network. This can be best accomplished by using a SIEM that the customer is already using to ingest host or network logs.
| What to Identify in the Baseline | Summary |
| ---------------------------------- | ----------|
| host information | hostname, OS / Version, IP address |
| registry information | host, registry key, registry value |
| users and groups | host, permissions, users, groups |
| installed software | host, application / version, functionality |
| identified services | host, service, port, network connections, associated processes, functionality |
| running processes | host, process, PID, network connections, associated services, functionality |
| scheduled tasks / cron jobs | host, scheduled task / cron job |

#
