<?php
/**
Renommer des fichiers en minuscules
frederic.glorieux@algone.net

 */
foreach(glob("*.[xX][mM][lL]") as $src) {
  $dir=dirname($src).'/';
  if ($dir='./')$dir='';
  $dest=$dir.strtolower(basename($src));
  if ($src == $dest) continue;
  echo $dir.$dest."\n";
  // hack windows, on renomme le fichier différemment d’abord
  // sinon la modification peut ne pas être prise en compte
  $tmp=$dir.'_'.basename($src);
  rename($src, $tmp);
  rename($tmp, $dest);
}

?>