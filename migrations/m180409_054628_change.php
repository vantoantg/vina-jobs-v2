<?php

use yii\db\Migration;

/**
 * Class m180409_054628_change
 */
class m180409_054628_change extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->execute("ALTER TABLE `tn_jobs` CHANGE `name` `slug` VARCHAR(255) CHARSET utf8 COLLATE utf8_general_ci NULL; ");
        $this->execute("ALTER TABLE `tn_jobs` ADD COLUMN `client_status` SMALLINT(1) DEFAULT 0 NULL AFTER `star`; ");
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180409_054628_change cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180409_054628_change cannot be reverted.\n";

        return false;
    }
    */
}
