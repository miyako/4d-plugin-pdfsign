# 4d-plugin-pdfsign
Sign PDF with PoDoFo 0.9.6

### Platform

| carbon | cocoa | win32 | win64 |
|:------:|:-----:|:---------:|:---------:|
||<img src="https://cloud.githubusercontent.com/assets/1725068/22371562/1b091f0a-e4db-11e6-8458-8653954a7cce.png" width="24" height="24" />|||

### Version

<img width="32" height="32" src="https://user-images.githubusercontent.com/1725068/73986501-15964580-4981-11ea-9ac1-73c5cee50aae.png"> <img src="https://user-images.githubusercontent.com/1725068/73987971-db2ea780-4984-11ea-8ada-e25fb9c3cf4e.png" width="32" height="32" />

Code based on the [pdfsign](http://podofo.sourceforge.net) example. 

**TODO**: return status object.

### Syntax

```4d
$in:=Folder(fk resources folder).file("TEST.pdf")
$out:=Folder(fk desktop folder).file("TEST.pdf")

$params:=New object

$params.in:=$in.platformPath
$params.out:=$out.platformPath

$params.password:=""  //password to unlock the private key file
$params.reason:="I agree"  //the reason of the signature
$params.field:="signature"  //field name to use; defaults toPoDoFoSignatureFieldXXX, where XXX is the object number
$params.replace:=True  //whether to use existing signature field, if such named exists; the field type should be a signature
$params.page:=1

$params.annotation:=New object
$params.annotation.unit:="mm"
$params.annotation.x:=10
$params.annotation.y:=10
$params.annotation.width:=100
$params.annotation.height:=100

$params.annotation.images:=New collection
$params.annotation.images[0]:=New object
$params.annotation.images[0].x:=5
$params.annotation.images[0].y:=5
$params.annotation.images[0].width:=60
$params.annotation.images[0].height:=60
$params.annotation.images[0].unit:="mm"
$params.annotation.images[0].file:=Folder(fk resources folder).file("4D.png").platformPath

$params.annotation.labels:=New collection
$params.annotation.labels[0]:=New object
$params.annotation.labels[0].x:=5
$params.annotation.labels[0].y:=55
$params.annotation.labels[0].width:=5
$params.annotation.labels[0].height:=55
$params.annotation.labels[0].font:="Helvetica"
$params.annotation.labels[0].font_size:=5
$params.annotation.labels[0].unit:="mm"
$params.annotation.labels[0].text:="宮古ケイスケが\r"+Timestamp+"\rに署名！"
$params.annotation.labels[0].font_color:=New object
$params.annotation.labels[0].font_color.red:=0
$params.annotation.labels[0].font_color.green:=0
$params.annotation.labels[0].font_color.blue:=1

$key:=Folder(fk resources folder).file("key.pem")
$cert:=Folder(fk resources folder).file("cert.pem")

If (True)
	/*
		must keep the line delimiter!
	*/
	$params.key:=$key.getText("us-ascii";Document unchanged)
	$params.cert:=$cert.getText("us-ascii";Document unchanged)
Else 
	$params.keyFile:=$key.platformPath
	$params.certFile:=$cert.platformPath
End if 

podofosign ($params)
```
