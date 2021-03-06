<?php

namespace App\SC\Libs\League;

use DB;
use Auth;
use Mail;

use Exception;

use Dwij\Laraadmin\Models\Module;
use Dwij\Laraadmin\Models\ModuleFields;
use Dwij\Laraadmin\Helpers\LAHelper;

use App\Role;
use App\SC\Models\User;
use App\SC\Models\League;
use App\SC\Models\League_Member;
use App\SC\Models\Team;
use App\SC\Models\League_Team;
use App\SC\Models\Division;

use SCHelper;
use SCUserLib;

class LeagueLib 
{
  /**
   * Laravel application
   *
   * @var \Illuminate\Foundation\Application
   */
  public $app;

  /**
   * Create a new confide instance.
   *
   * @param \Illuminate\Foundation\Application $app
   *
   * @return void
   */
  public function __construct($app)
  {
    $this->app = $app;
  }

  /**
   * Create League 
   * @param  $data: array(name, creator_uid)
   */
  public function createLeague($data=array()) {
    // TODO: check duplication of league name
    $league = League::create([
        'name'        => $data['name'], 
        'creator_uid' => $data['creator_uid'], 
    ]);

    if ($league) {
      $league = $league->initialize();
    }

    return $league;
  }
  public function checkLeagueExist($name) {
    $count = League::where('name', $name)->count();
    if ($count) { return true; }
    return false;
  }

  /**
   * search league
   */
  public function searchLeague($term) {
    $currentUser = SCUserLib::currentUser();
    
    //$leagues = League::where('name', 'LIKE', '%'.$term.'%')->get();
    $query = "SELECT t.*, lm.active, lm.status 
              FROM leagues AS t 
              LEFT JOIN league_members AS lm 
                    ON t.id=lm.league_id AND lm.user_id=? 
              WHERE t.name LIKE ?";
    $leagues = DB::select($query, array($currentUser->id, '%'.$term.'%'));
    return $leagues;
  }

  public function searchLeagueWithTeam(Team $team, $term) {
    $query = "SELECT l.*, lt.active, lt.status 
              FROM leagues AS l 
              LEFT JOIN league_teams AS lt 
                    ON l.id=lt.league_id 
              WHERE (lt.team_id = ? OR lt.team_id is NULL) 
                AND l.name LIKE ?";
    $leagues = DB::select($query, array($team->id, '%'.$term.'%'));
    return $leagues;
  }

  //////////////////////////////////////////////////////////////////////////////
  /// League Member
  //////////////////////////////////////////////////////////////////////////////
  public function isLeagueMember($user_id, $league_id) {
    $lm_record = League_Member::getRecord($league_id, $user_id);
    if ($lm_record && $lm_record->active) {
      return true;
    }
    return false;
  }
  public function isLeagueManager($user_id, $league) {
    if ($league->creator_uid == $user_id) {
      return true;
    }
    return false;
  }

  /**
   * Sent Request to League
   */
  public function sentRequestLeagueMember($user_id, $league_id) {
    $lm_record = League_Member::getRecord($league_id, $user_id);
    if ($lm_record) {
      if ($lm_record->active) {
        return 10;    // Already Member
      } else {
        $lm_record->status = League_Member::STATUS_SEND;
        $lm_record->save();
        return 1;   // OK
      }
    } else {
      $lm_record = League_Member::create(array(
        'league_id' => $league_id,
        'user_id' => $user_id, 
        'active'  => 0,
        'status'  => League_Member::STATUS_SEND
      ));
      if ($lm_record) {
        return 1;   // OK
      }
    }
    return false;
  }
  public function cancelRequestLeagueMember($user_id, $league_id) {
    $lm_record = League_Member::getRecord($league_id, $user_id);
    if ($lm_record) {
      if ($lm_record->active) {
        return 10;    // Already Member
      } else {
        $lm_record->status = '';
        $lm_record->save();
        return 1;   // OK
      }
    }
    return 1;
  }
  public function allowLeagueMember($user_id, $league_id) {
    $lm_record = League_Member::getRecord($league_id, $user_id);
    if ($lm_record) {
      if ($lm_record->active) {
        return 10;    // Already Member
      } else if($lm_record->status==League_Member::STATUS_SEND) {
        $lm_record->status = League_Member::STATUS_ACTIVE;
        $lm_record->active = 1;
        $lm_record->save();
        return 1;   // OK
      } else {
        return 11;
      }
    } else {
      $lm_record = League_Member::create(array(
        'league_id' => $league_id,
        'user_id' => $user_id, 
        'active'  => 1,
        'status'  => League_Member::STATUS_ACTIVE
      ));
      if ($lm_record) {
        return 1;   // OK
      }
    }
    return false;
  }

  public function leaveLeagueMember($user_id, $league_id) {
    $lm_record = League_Member::getRecord($league_id, $user_id);
    if ($lm_record) {
      if ($lm_record->active) {
        $lm_record->status = '';
        $lm_record->active = 0;
        $lm_record->save();
        return true;
      }
    }
    return true;
  }
  
  public function getSeasons($league_id) {
    $league = League::find($league_id);
    if ($league) {
      return $league->seasons();
    }
    return false;
  }
}
