<?php

namespace Database\Seeders;

use App\Models\Artist;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ArtistsalesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $idVitali = Artist::where('name', 'Tommaso Vitali')->first()->id;
        $idVasco = Artist::where('name', 'Vasco Rossi')->first()->id;
        $user = User::find(2);
        $user->artistsales()->attach([$idVitali, $idVasco]);
    }
}
