<h2>Find_HTML_inj.py</h2>
Script will import hosts from host.txt and find frostb1te">bugbounty within the source of the sites. Popularly used with paraspider

<b>COMMAND: </b>
```
paramspider -o ./host.txt -d WEBSITE.COM
sed -i 's/FUZZ/frostb1te">bugbounty/g' host.txt
python3 Find_HTML_inj.py
```

