<HTML>
<HEAD>
<TITLE>
Poster
</TITLE>
<META http-equiv=Content-Type content="text/html; charset=windows-1251">
<META http-equiv=Content-Language content=ru>
<link href="poster.css" rel="stylesheet" type="text/css">
</HEAD><body bgcolor="#CCFFFF">

<?
  if(isset($PostUpload)){
    echo "<b>PostUpload</b><br>";
    if(isset($filename) && isset($filetext)){
      if(trim($filename)!=""){
        echo "������ �� ������: $filename";
        // - ������ -
        $fp = fopen($filename, "w");
        fwrite($fp,$filetext);
        fclose($fp);
        $add_FN = $filename;
      } else {
        echo "��� ����� �� ����� ���� ������.<br>";
      };
    } else
      echo "��������� ���� ���������!<br>";
  };
  // ------------------
  if(isset($ClassicUpload)){
    echo "<b>ClassicUpload</b><br>"; ?>
    userfile = <? echo $userfile; ?><br>
    userfile_name = <?echo $userfile_name; ?><br>
    userfile_size = <?echo $userfile_size; ?><br>
    userfile_type = <?echo $userfile_type; ?><br>
    Copy file
<?  echo("Copy $userfile to $userfile_name");
    copy("$userfile","$userfile_name"); 
    $add_FN = $userfile_name;
  };

  // - ���������� � ������ ������ ���� ��� ��� ��� ��� -
  if (isset($add_FN)){
    $found = false;
    $f = file("files.txt");
    for($i=0;$i<count($f);$i++)
      if (trim($f[$i])==$add_FN) {
        $found = true; break;
      };
    if(!$found){
      $fp = fopen("files.txt", "a");
      fwrite($fp,"\r\n".$add_FN);
      fclose($fp);
    };
  };
?>

<p><font face="Arial, Helvetica, sans-serif"><strong>����� �� �������:</strong></font></p>
<table border="1" cellspacing="0" cellpadding="0">
  <tr>
    <td class="TableHeader">��� �����</td>
    <td class="TableHeader">������ (����)</td>
    <td class="TableHeader">��������� ����������� �����</td>
    <td class="TableHeader">��������� ��������� � �����</td>
  </tr>
  <? $l = file("files.txt");
     $totalSize = 0;
     for($i=0;$i<count($l);$i++){
       $FN = trim($l[$i]);
  ?>
  <tr>
    <td class="TableCell"><a href="<? echo $FN; ?>"><? echo $FN; ?></a></td>
    <td class="TableCell"><? echo filesize($FN); $totalSize += filesize($FN); ?></td>
    <td class="TableCell"><? print(date( "d.m.Y H:i:s",filemtime($FN))); ?></td>
    <td class="TableCell"><? print(date( "d.m.Y H:i:s",fileatime($FN))); ?></td>
  </tr>
  <? }; ?>
</table>
<p><strong><font size="2" face="Microsoft Sans Serif, MS Sans Serif">����� ������: 
  <? print count($l); ?> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  ����� �����: <? echo $totalSize; ?>
  ����</font></strong></p>
<form name="form1" method="post" action="">
  <p><font size="-1" face="Microsoft Sans Serif, MS Sans Serif"><strong>��� ����� 
    (��� ���������):</strong></font> 
    <input type="text" name="filename">&nbsp;&nbsp;&nbsp;<input name="PostUpload" type="submit" value="���������!">
  </p>
  <p>
    <textarea name="filetext" cols="120" rows="14"></textarea>
  </p>
</form>

<form ENCTYPE="multipart/form-data" method=POST action="">
  <INPUT TYPE="hidden" name="MAX_FILE_SIZE" value="100000000">
  <strong><font size="-1" face="Microsoft Sans Serif, MS Sans Serif">��������� 
  �� ������ ����:</font></strong> 
  <INPUT NAME="userfile" TYPE="file" size="60"> 
  <INPUT name="ClassicUpload" TYPE="submit" VALUE="���������!">
</form>


<p>&nbsp;</p>
</HTML>
