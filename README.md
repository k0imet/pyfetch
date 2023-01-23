# pyfetch
This is a python3 alternative to [gofetch](https://github.com/tr3ss/gofetch)

The tool has the same exact capabilities as gofetch where it plainly outputs the CVEs or alternatively include `-info` to get the full CVE info. 

:smile:

## Installation:
```bash
git clone https://github.com/k0imet/pyfetch.git
cd pyfetch 
chmod +x pyfetch.py 
./pyfetch.py
```

## Usage:

```bash

[demo@demo ~]$ ./pyfetch.py 
Usage: pyfetch day|week [-info]
```

## Get top 10 CVEs trending in the last 24 hours:
```bash
[demo@demo ~]$ ./pyfetch.py day
CVE-2022-4135
CVE-2022-4020
CVE-2022-4116
CVE-2022-3602
CVE-2021-35587
CVE-2017-5638
CVE-2022-31097
CVE-2022-23093
CVE-2022-24999
CVE-2022-44635
```

## Get top 10 CVEs trending in the last week:

```bash
[demo@demo ~]$ ./pyfetch.py week
CVE-2022-4116
CVE-2022-23093
CVE-2022-21225
CVE-2022-41325
CVE-2022-3328
CVE-2022-4139
CVE-2022-37017
CVE-2022-30528
CVE-2022-4257
CVE-2022-28607
```

## Get CVE info

```bash 
[demo@demo ~]$ ./pyfetch.py day -info
CVE-2022-4116
Description: A vulnerability was found in quarkus. This security flaw happens in Dev UI Config Editor which is vulnerable to drive-by localhost attacks leading to remote code execution.
Severity: CRITICAL
-----------------------------------
CVE-2022-23093
Description: None
Severity: None
-----------------------------------
CVE-2022-21225
Description: Improper neutralization in the Intel(R) Data Center Manager software before version 4.1 may allow an authenticated user to potentially enable escalation of privilege via adjacent access.
Severity: HIGH
-----------------------------------
[...]
```
## Send The mail 

```bash 
[demo@demo pyfetch]$ ./send_cve_list.sh 
```

![image](https://user-images.githubusercontent.com/60982828/205901708-d52d2394-3d7a-4816-acbe-188dd8f5dd05.png)


Or 

```bash 
[demo@demo pyfetch] ./send_cve_list.sh
```


![image](https://user-images.githubusercontent.com/60982828/213977660-8c09187f-8a1e-4ada-944b-e56dfa414aed.png)
