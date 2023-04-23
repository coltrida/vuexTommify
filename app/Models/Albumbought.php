<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

/**
 * App\Models\Albumbought
 *
 * @method static \Illuminate\Database\Eloquent\Builder|Albumbought newModelQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Albumbought newQuery()
 * @method static \Illuminate\Database\Eloquent\Builder|Albumbought query()
 * @mixin \Eloquent
 */
class Albumbought extends Model
{
    use HasFactory;
    protected $guarded = [];
    protected $table = 'albumsale_users';
}
