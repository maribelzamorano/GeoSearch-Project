#! /usr/bin/python
import os
import sys
import time
import xml.dom.minidom


def execute(cmd):
        for line in os.popen(cmd):
                print line.replace("\n","")

def execToString(cmd):
        return os.popen(cmd).read().replace("\n","")

def getSvnXml():
	return execToString("svn status --xml")

def getText(nodelist):
    rc = ""
    for node in nodelist:
        if node.nodeType == node.TEXT_NODE:
            rc = rc + node.data
    return rc




execute("rm -Rf patches")
dom			= xml.dom.minidom.parseString(getSvnXml())
entries		= dom.getElementsByTagName("entry")
pwd			= execToString("pwd")
pwd			= pwd[pwd.rfind("/")+1:]
patchDir	= "patches/subpatch_"+execToString("date +%Y-%m-%d_%H:%M:%S")+"/"+pwd

execute("mkdir -p "+patchDir)

for e in entries:
	wc = e.getElementsByTagName("wc-status")[0]
	status = wc.getAttribute("item")
	if status=="unversioned" or  status=="modified":
		tDir=patchDir
		path = e.getAttribute("path")
		lios = path.rfind("/")
		if lios > -1:
			tDir+='/'+path[:lios]
			execute('mkdir -p '+tDir)
#			print "Ordner "+tDir+" erstellt."
		execute('cp -r '+path+' '+tDir)
		print('Kopiere '+path)

