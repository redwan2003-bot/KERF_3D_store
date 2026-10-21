<?php

namespace App\Models;

use CodeIgniter\Model;

class DriveSyncLogModel extends Model
{
    protected $table            = 'drive_sync_log';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $returnType       = 'array';

    protected $allowedFields = [
        'sync_type',
        'status',
        'products_synced',
        'images_added',
        'images_updated',
        'images_removed',
        'errors',
        'started_at',
        'completed_at',
    ];

    protected $useTimestamps = false;
}
