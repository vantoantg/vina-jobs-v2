<?php

use yii\db\Migration;

/**
 * Class m180622_060027_experience
 */
class m180622_060027_experience extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->execute('ALTER TABLE `tn_jobs` ADD COLUMN `experience` INT(3) DEFAULT 0 NULL AFTER `working_time`; ');
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180622_060027_experience cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180622_060027_experience cannot be reverted.\n";

        return false;
    }
    */
}
