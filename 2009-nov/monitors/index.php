<html>
<head>
<title>���������� � �������</title>
<style type="text/css">
    .c  { text-align: center }
    .j  { text-align: justify }
    .r  { text-align: right }
    em  { color: red }
    .attention { text-align: center; font-family: arial; font-size: big; }
    h1 { text-align: center; font-family: arial; font-size: 20 }
    h2 { text-align: center; font-family: arial; margin-top: 36; font-size: 18 }
    h3 { text-align: center; font-family: arial; font-size: 16 }
    table.main {
	width: 80%;
	border-collapse: collapse;
	border: 1px black solid;
	background-color: #CCFFFF;
    }
    td {
        border: 1px black solid;
        padding: 5pt;
        text-align: left;
    }
    th {
        border: 1px black solid;
        padding: 3pt;
    }
  </style>
</head>
<body>
    <h1>���������� � �������</h1>
    
    <h2>����������:</h2>

    <p class="c">
    <center>
        <table class="main" >
            <tr>
                <th bgcolor="#FFFFCC">�����������</th>
                <th bgcolor="#FFFFCC">���� ������</th>
                <th bgcolor="#FFFFCC">�����</th>
                <th bgcolor="#FFFFCC">�����</th>
            </tr>
            <tr>
                <td class="main">������ ����� / ������</td>
                <td>�����������</td>
                <td>18:30</td>
                <td>���. 216</td>
            </tr>
            <tr>
                <td>����������</td>
                <td>�������</td>
                <td>18:30</td>
                <td>���-1</td>
            </tr>
            <tr>
                <td>����������</td>
                <td>�������</td>
                <td>16:45</td>
                <td>���-3</td>
            </tr>
        </table>
    </center>
    </p>


    <h2>������ ���������:</h2>
<center>
<?
  $l=file("files.txt");
  for ($i=0;$i<count($l);$i++){
    $l[$i] = trim($l[$i]);
    if (substr($l[$i],-4)==".dat") 
      echo "<a href=\"show.php?FN=$l[$i]\">$l[$i]</a><br>";
  };

/*  $dn = opendir("");
  $files = array();
  while(gettype($file=readdir($dn))!=boolean){
    if($file!="." && $file!=".." && $file!="links.txt" &&
       $file!="index.php" &&
       !is_dir($file) && substr($file,-4)==".dat"){
      array_push($files,$file);
    };
  };
  closedir($dn);
  //
  sort($files);
  // 
  for($line=0;$line<count($files);$line++){
    $link = str_replace("<b>","",$files[$line]);
    $link = str_replace("</b>","",$link);
    echo("<a href=\"show.php?FN=$link\">$files[$line]</a><br>");
    if (($line+1) % 15 == 0) echo("<td Width=\"200\">"); 
  }; */
?>

� ���������, ��������� ������ ���������� (17.09.2004) ���� ������� ��-�� ����, ���
���-�� ������ �� � ���'�.
</body>
</html>
