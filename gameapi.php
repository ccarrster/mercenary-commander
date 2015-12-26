<?php
require_once('dbconfig.php');
class Game{
	var $id = '';
	var $timestamp = '';
}

class User{
	var $id = '';
	var $timestamp = '';
	var $handle = '';
}

function getGame($id){
	$link = getLink();
	$resultQuery = mysqli_query($link, "SELECT id, createdtimestamp FROM game WHERE id = ".mysqli_real_escape_string($link, $id).";");

	$games = array();
	while ($row = $resultQuery->fetch_object()){
	    $id = $row->id;
	    $timestamp = $row->createdtimestamp;
	    $game = new Game();
	    $game->id = $id;
	    $game->timestamp = $timestamp;
	    $games[] = $game;
	}
	closeLink($link);
	return $games;
}

function getUser($id){
	$link = getLink();
	$resultQuery = mysqli_query($link, "SELECT id, createdtimestamp, handle FROM user WHERE id = ".mysqli_real_escape_string($link, $id).";");
	$users = array();
	while ($row = $resultQuery->fetch_object()){
	    $id = $row->id;
	    $timestamp = $row->createdtimestamp;
	    $handle = $row->handle;
	    $user = new User();
	    $user->id = $id;
	    $user->timestamp = $timestamp;
	    $user->handle = $handle;
	    $users[] = $user;
	}
	closeLink($link);
	return $users;
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
		$games = getGame($_GET['id']);
		echo(json_encode($games));
	} elseif($action == 'createGame'){
		$resultQuery = mysqli_query($link, "INSERT INTO game VALUES();");
		$gameId = mysqli_insert_id($link);
		echo(json_encode($gameId));
	} elseif($action == 'createUser'){
		if(isset($_GET['handle'])){
			$resultQuery = mysqli_query($link, "SELECT count(*) as count FROM user WHERE handle = '".mysqli_real_escape_string($link, $_GET['handle'])."';");
			while ($row = $resultQuery->fetch_object()){
				$count = $row->count;
			}
			if($count == '0'){
				$resultQuery = mysqli_query($link, "INSERT INTO user (handle) VALUES('".mysqli_real_escape_string($link, $_GET['handle'])."');");
				$userId = mysqli_insert_id($link);
				echo(json_encode($userId));
			} else {
				echo(json_encode('handle already used'));
			}
		} else {
			echo(json_encode('A handle must be set'));
		}
	} elseif($action == 'getUsers'){
		$resultQuery = mysqli_query($link, "SELECT id, createdtimestamp, handle FROM user;");
		$users = array();
		while ($row = $resultQuery->fetch_object()){
		    $id = $row->id;
		    $timestamp = $row->createdtimestamp;
		    $handle = $row->handle;
		    $user = new User();
		    $user->id = $id;
		    $user->timestamp = $timestamp;
		    $user->handle = $handle;
		    $users[] = $user;
		}
		echo(json_encode($users));
	} elseif($action == 'getUser'){
		$users = getUser($_get['id']);
		echo(json_encode($users));
	} elseif($action == 'joinGame'){
		if(isset($_GET['gameid']) && isset($_GET['userid'])){
			$games = getGame($_GET['gameid']);
			$users = getUser($_GET['userid']);
			if(count($games) == 0){
				echo(json_encode('Game not found'));
			} elseif(count($users) == 0){
				echo(json_encode('User not found'));
			} else {
				$resultQuery = mysqli_query($link, "SELECT count(*) as count FROM gameuser WHERE gameid = ".mysqli_real_escape_string($link, $_GET['gameid'])." AND userid = ".mysqli_real_escape_string($link, $_GET['userid']).";");
				while ($row = $resultQuery->fetch_object()){
					$count = $row->count;
				}
				if($count == '0'){
					$resultQuery = mysqli_query($link, "INSERT INTO gameuser (gameid, userid) VALUES(".mysqli_real_escape_string($link, $_GET['gameid']).", ".mysqli_real_escape_string($link, $_GET['userid']).");");
					$userId = mysqli_insert_id($link);
					echo(json_encode($userId));
				} else {
					echo(json_encode('user already joined game'));
				}
			}
		} else {
			echo(json_encode("userid and gameid must be set"));
		}
	} elseif($action == 'leaveGame'){
		if(isset($_GET['gameid']) && isset($_GET['userid'])){
			$games = getGame($_GET['gameid']);
			$users = getUser($_GET['userid']);
			if(count($games) == 0){
				echo(json_encode('Game not found'));
			} elseif(count($users) == 0){
				echo(json_encode('User not found'));
			} else {
				$resultQuery = mysqli_query($link, "SELECT count(*) as count FROM gameuser WHERE gameid = ".mysqli_real_escape_string($link, $_GET['gameid'])." AND userid = ".mysqli_real_escape_string($link, $_GET['userid']).";");
				while ($row = $resultQuery->fetch_object()){
					$count = $row->count;
				}
				if($count != '0'){
					$resultQuery = mysqli_query($link, "DELETE FROM gameuser WHERE gameid = ".mysqli_real_escape_string($link, $_GET['gameid'])." AND userid = ".mysqli_real_escape_string($link, $_GET['userid']).";");
					echo(json_encode('user left game'));
				} else {
					echo(json_encode('user not found in game'));
				}
			}
		} else {
			echo(json_encode("userid and gameid must be set"));
		}
	} else {
		echo(json_encode("Action " . $action . " not supported."));
	}
	closeLink($link);
} else {
	echo(json_encode("No action provided. Supported actions(getGames, getGame, createGame, createUser, getUsers, getUser, joinGame, leaveGame)"));
}

?>