<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;

class Brand extends Model
{

    use Sluggable;
    protected $fillable = [
        'image',
        'thumbnail',
        'name',
        'slug',
        'content',
        'cat_ust',
        'status'
    ];

    public function items(){
        return $this->hasMany(Product::class, 'brand_id', 'id');
    }

    public function brand(){
        return $this->hasOne(Brand::class, 'id', 'cat_ust');
    }


    public function getTotalProductCount()
    {
        $total = $this->items()->count();

        foreach ($this->subBrand as $childBrand) {
          $total += $childBrand->items()->count(); // Alt kategorilerdeki ürün sayısını totale ekle
        }

        return $total;
    }


    public function sluggable(): array
    {
        return [
            'slug' => [
                'source' => 'name'
            ]
        ];
    }
}
