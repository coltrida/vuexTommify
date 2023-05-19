<?php

namespace Database\Seeders;

use App\Models\Artist;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::insert([
            [
                'name' => 'admin',
                'email' => 'admin@admin.it',
                'role' => 'admin',
                'password' => Hash::make('123456'),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now()
            ],
            [
                'name' => 'cacao',
                'email' => 'cacao@cacao.it',
                'role' => 'user',
                'password' => Hash::make('123456'),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now()
            ],
            [
                'name' => 'pippo',
                'email' => 'pippo@pippo.it',
                'role' => 'user',
                'password' => Hash::make('123456'),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now()
            ],
            [
                'name' => 'cacao3',
                'email' => 'cacao3@cacao3.it',
                'role' => 'user',
                'password' => Hash::make('123456'),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now()
            ],
            [
                'name' => 'Vasco Rossi',
                'email' => 'vasco@vasco.it',
                'role' => 'artist',
                'password' => Hash::make('123456'),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now()
            ],
            [
                'name' => 'Tommaso Vitali',
                'email' => 'vitali@vitali.it',
                'role' => 'artist',
                'password' => Hash::make('123456'),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now()
            ],
            [
                'name' => 'Shakira',
                'email' => 'shakira@shakira.it',
                'role' => 'artist',
                'password' => Hash::make('123456'),
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now()
            ],
        ]);

        User::factory()->count(50)->create();
        $artists = User::factory()->count(50)->create([
            'role' => 'artist',
        ]);

        $artists->each(function ($artist){
            Artist::create([
                'name' => $artist->name,
                'user_id' => $artist->id,
                'cost' => \Arr::random([23, 44, 6, 3, 66, 43, 78]),
                'category' => \Arr::random(['pop', 'rock', 'heavy metal', 'classic'])
                ]);
        });
    }
}
