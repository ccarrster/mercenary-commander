<?php

function getLink(){
	$link = mysqli_connect("localhost", "root", "root", "mercenarycommander", "8889");
	return $link;
}

function closeLink($link){
	mysqli_close($link);
}

class game{
	var id = '';
	var timestamp = '';
}

if(isset($_GET['action'])){
	$link = getLink();
	$action = $_GET['action'];
	if($action == 'getGames'){
		$resultQuery = mysqli_query($link, "SELECT id, createdtimestamp FROM game;");
		$games = array();
		while ($row = $resultQuery->fetch_object()){
		    $id = $row->id;
		    $timestamp = $row->createdtimestamp;
		    $game = new Game();
		    $game->id = $id;
		    $game->timestamp = $timestamp;
		}
		echo(json_encode($games));
	} elseif($action == 'getGame'){

	} elseif($action == 'createGame'){

	} else {
		echo(json_encode("Action " . $action . " not supported."));
	}
	closeLink($link);
} else {
	echo(json_encode("No action provided. Supported actions(getGames, getGame, createGame)"));
}

?>