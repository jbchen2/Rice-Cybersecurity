# Red vs Blue Capstone Project

This project presentation details both Red and Blue Team operations within a virtualized environment.

The following procedure was used by the Red Team in order to attack the vulnerable machine.

⋅⋅*  Nmap was used to discover the vulnerable machine and for port enumeration.
⋅⋅*  Directory traversal through a LFI vulnerability was used to discover a hidden directory.
⋅⋅*  Hydra was used to brute force a user's password in order to login and gain access to the hidden directory.
⋅⋅*  Crackstation was used to crack a MD5 password hash in order to elevate privileges and gain access to an Administrator's account.
⋅⋅*  Msfvenom was used to create a reverse shell script against the vulnerable machine.
⋅⋅*  Msfconsole was used to create a listener, gain a metepreter shell, and remotely execute commands against the vulnerable server.

Kibana was utilized by the Blue Team in order to perform the following tasks.

⋅⋅*  Identify and provide mitigation strategies for port scans.
⋅⋅*  Identify and provide mitigation strategies for LFI vulnerabilities.
⋅⋅*  Identify and provide mitigation strategies for brute force attacks.
⋅⋅*  Identify and provide mitigation strategies for reverse shell uploads.