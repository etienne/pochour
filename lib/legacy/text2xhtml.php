<?php

require 'writedown.php';
$filename = $argv[1];
$contents = file_get_contents($filename);
print Writedown::Text2XHTML($contents);

?>