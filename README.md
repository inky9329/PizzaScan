<h2>PizzaScan!</h2>

Team Pizzabyte proudly presents the new PizzaScan tool! This tool automates finding bugs (Specificly XSS) with minimal amount of requests.

Installation:

```
git clone https://github.com/frostb1ten/PizzaScan
cd PizzaScan
chmod +x PizzaScan.sh
```

<b>For a single domain</b>

```
./Pizzascan.sh website.com -single
```

<b>For collecting subdomains AND checking sites</b>

```
./Pizzascan.sh website.com -list
```

All vulnerable sites will display in output.txt

<h3>***This tool is for VDP/Bugbounty useage only. We are not liable for any damages or trouble caused by this scanner.***</h3>
