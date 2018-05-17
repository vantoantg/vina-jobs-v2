<?php

use yii\db\Migration;

/**
 * Class m180517_060358_add_field
 */
class m180517_060358_add_field extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->execute("ALTER TABLE `tn_file_uploads` ADD COLUMN `arranged` INT(5) DEFAULT 1 NULL AFTER `file_type`; ");
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180517_060358_add_field cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180517_060358_add_field cannot be reverted.\n";

        return false;
    }
    */
}
