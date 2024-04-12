# Planning

Before starting anything, conversing with the customer about how the threat hunt will be conducted is paramount. Some thing to discuss are: 
1. Understanding the scope of the threat hunt and the intentions the customer has for us
2. How are we going to tap into their network (we have our own sensor and SIEM we connect through a span port or inline tap)
3. What tools does the customer already utilized to collect logs that we may utilize (Useful for obtaining host logs)

Once their is a good idea of what to expect we can start creating our threat hunt operational plan (op )

# Utilize Inteligence

## Which APT's are going to be incorporated into the threat hunt?
Discern what type of network the threat hunt will occur on (Hybrid, Cloud, ICS/SCADA, SIPR, etc.)
- Find at least 3 Advanced Persistant Threats (APTs) that can be potentially found on the network
- Utilize a mix of threat intelligence platforms to get relevent Indicators of Compromise (IoCs) and Tactics Techniques and Procedures (TTPs)

Example: MITRE is a great open-source platform that provides Intelligence, IoCs, and matrices for Enterprise, Mobile and ICS environments, showcasing tactics and techniques for each type of environment.

# Create a Baseline plan
Incorporate a Baseline section in the threat hunt so the analysts can spend time familiarizing themselves with the network. How much time spent on baselining is indicitive to the network. For one month threat hunts, we try to spend at most two weeks baselining the network. This can be best accomplished by using a SIEM that the customer is already using to ingest host or network logs or your own SIEM if you are connecting your own sensor to the network.

| What to Identify in the Baseline | Information to Collect for the Identified Information |
| ---------------------------------- | ----------|
| host information | hostname, OS / Version, IP address |
| registry information | host, registry key, registry value |
| users and groups | host, permissions, users, groups |
| installed software | host, application / version, functionality |
| identified services | host, service, port, network connections, associated processes, functionality |
| running processes | host, process, PID, network connections, associated services, functionality |
| scheduled tasks / cron jobs | host, scheduled task / cron job |

# Create a Hunt Plan
Utilizing the threat intelligence, comprehensive TTPs can now be used to hunt on the network. When creating the threat hunt, ensure to antipate anything and everything the APT has been known to do.

## General Hunt Tasks 
| Task # | Technique Used | T-Code | CyberKill Chain Phase | Tasks / Information | Detection Method / Notes | Host / Network | Analyst Assigned | Status (In Progress / Complete / Pending RFI) | Created by |
| ------ | -------------- | ------ | --------------------- | ------------------- | ------------------------ | -------------- | ---------------- | --------------------------------------------- | ---------- |

In the "Tasks / Information" section,
1. Basic information
2. What devices are affected by this technique
3. What monitoring tool(s) need to be used
4. Task(s) to accomplish finding this techniqie
5. Prevention Method(s)



