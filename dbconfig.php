<?php
function getLink(){
	$link = mysqli_connect("localhost", "root", "root", "mercenarycommander", "3306");
	return $link;
}

function closeLink($link){
	mysqli_close($link);
}
?>