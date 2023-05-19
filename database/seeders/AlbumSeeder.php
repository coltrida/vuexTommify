<?php

namespace Database\Seeders;

use App\Models\Album;
use App\Models\Artist;
use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class AlbumSeeder extends Seeder
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
        $idShakira = Artist::where('name', 'Shakira')->first()->id;

        Album::insert([
            [
                'name' => 'Primo Album',
                'artist_id' => $idVitali,
                'cost' => 10,
                'created_at' => Carbon::now()
            ],
            [
                'name' => 'Secondo Album',
                'artist_id' => $idVitali,
                'cost' => 14,
                'created_at' => Carbon::now()
            ],
            [
                'name' => 'Terzo Album',
                'artist_id' => $idVitali,
                'cost' => 11,
                'created_at' => Carbon::now()
            ],
            [
                'name' => 'Alba Chiara',
                'artist_id' => $idVasco,
                'cost' => 13,
                'created_at' => Carbon::now()
            ],
            [
                'name' => 'Waka Waka',
                'artist_id' => $idShakira,
                'cost' => 12,
                'created_at' => Carbon::now()
            ]
        ]);
    }
}
