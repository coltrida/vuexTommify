<?php

namespace App\Services;

use App\Models\User;

class UserService
{
    public function listUtenti()
    {
        return User::ute()->get();
    }

    public function listUtentiPaginate()
    {
        return User::ute()->paginate(10);
    }

    public function findUser($request)
    {
        return User::ute()->where('name', 'like', '%'.$request->nameToFind.'%')->paginate(10);
    }

    public function deleteUser($idUser)
    {
        User::find($idUser)->delete();
    }
}
