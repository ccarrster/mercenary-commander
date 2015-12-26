<?php
require_once('dbconfig.php');
class Game{
	var $id = '';
	var $timestamp = '';
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
		    $games[] = $game;
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