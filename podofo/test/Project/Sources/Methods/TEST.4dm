//%attributes = {}
$in:=Folder:C1567(fk resources folder:K87:11).file("TEST.pdf")
$out:=Folder:C1567(fk desktop folder:K87:19).file("TEST.pdf")

$params:=New object:C1471

$params.in:=$in.platformPath
$params.out:=$out.platformPath

$params.password:=""  //password to unlock the private key file
$params.reason:="I agree"  //the reason of the signature
$params.field:="signature"  //field name to use; defaults toPoDoFoSignatureFieldXXX, where XXX is the object number
$params.replace:=True:C214  //whether to use existing signature field, if such named exists; the field type should be a signature
$params.page:=1

$params.annotation:=New object:C1471
$params.annotation.unit:="mm"
$params.annotation.x:=10
$params.annotation.y:=10
$params.annotation.width:=100
$params.annotation.height:=100

$params.annotation.images:=New collection:C1472
$params.annotation.images[0]:=New object:C1471
$params.annotation.images[0].x:=5
$params.annotation.images[0].y:=5
$params.annotation.images[0].width:=60
$params.annotation.images[0].height:=60
$params.annotation.images[0].unit:="mm"
$params.annotation.images[0].file:=Folder:C1567(fk resources folder:K87:11).file("4D.png").platformPath

$params.annotation.labels:=New collection:C1472
$params.annotation.labels[0]:=New object:C1471
$params.annotation.labels[0].x:=5
$params.annotation.labels[0].y:=55
$params.annotation.labels[0].width:=5
$params.annotation.labels[0].height:=55
$params.annotation.labels[0].font:="Helvetica"
$params.annotation.labels[0].font_size:=5
$params.annotation.labels[0].unit:="mm"
$params.annotation.labels[0].text:="宮古ケイスケが\r"+Timestamp:C1445+"\rに署名！"
$params.annotation.labels[0].font_color:=New object:C1471
$params.annotation.labels[0].font_color.red:=0
$params.annotation.labels[0].font_color.green:=0
$params.annotation.labels[0].font_color.blue:=1

$key:=Folder:C1567(fk resources folder:K87:11).file("key.pem")
$cert:=Folder:C1567(fk resources folder:K87:11).file("cert.pem")

If (True:C214)
/*
must keep the line delimiter!
*/
	$params.key:=$key.getText("us-ascii";Document unchanged:K24:18)
	$params.cert:=$cert.getText("us-ascii";Document unchanged:K24:18)
Else 
	$params.keyFile:=$key.platformPath
	$params.certFile:=$cert.platformPath
End if 




podofosign ($params)
