<?php

use yii\db\Migration;

/**
 * Class m180503_152634_change_jobs
 */
class m180503_152634_change_jobs extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->execute("
		ALTER TABLE `tn_jobs` CHANGE `salary` `salary` INT(3) NULL, 
		ADD COLUMN `working_time` INT(3) NULL AFTER `salary`; 
		");
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180503_152634_change_jobs cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180503_152634_change_jobs cannot be reverted.\n";

        return false;
    }
    */
}
