<?php

namespace App\Models;

use CodeIgniter\Model;

class DriveConfigModel extends Model
{
    protected $table      = 'drive_config';
    protected $primaryKey = 'config_key';
    protected $returnType = 'array';

    protected $allowedFields = [
        'config_key',
        'config_value',
        'description',
        'updated_at',
    ];

    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = '';
    protected $updatedField  = 'updated_at';

    /**
     * Get a config value by key with optional fallback.
     */
    public function getVal(string $key, ?string $default = null): ?string
    {
        $row = $this->find($key);
        return $row ? $row['config_value'] : $default;
    }

    /**
     * Set a config value.
     */
    public function setVal(string $key, string $value, ?string $description = null): bool
    {
        $data = [
            'config_key'   => $key,
            'config_value' => $value,
            'updated_at'   => date('Y-m-d H:i:s'),
        ];
        if ($description !== null) {
            $data['description'] = $description;
        }

        return (bool) $this->save($data);
    }
}
