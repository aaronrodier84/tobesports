<?php

namespace App\SC\Libs;

use DB;
use Auth;

use Dwij\Laraadmin\Models\Module;
use Dwij\Laraadmin\Models\ModuleFields;

use App\Role;
use App\SC\Models\User;
use App\SC\Models\Node;

use SCUserLib;
use SCPhotoLib;

Trait PhotoLib_UI
{
  /**
   * User's photo browser 
   */
  public function render_photo_browser() {
    $currentUser = SCUserLib::currentUser();
    if ($currentUser && $user = User::find($currentUser->id)) {
      $params = array();
      $params['user'] = $user;
      $params['photos'] = SCPhotoLib::getPhotos($user->getNode());
      
      return view('sc.comm.partials.photo.photo_browser', $params);
    }
  }

  public function render_node_photo_browser(Node $node) {
    $currentUser = SCUserLib::currentUser();

    $params = array();
    $params['photos'] = SCPhotoLib::getPhotos($node);
    
    return view('sc.comm.partials.photo.photo_browser', $params);
  }
}
