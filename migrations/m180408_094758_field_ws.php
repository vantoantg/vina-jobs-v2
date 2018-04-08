<?php

use yii\db\Migration;

/**
 * Class m180408_094758_field_ws
 */
class m180408_094758_field_ws extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
		$this->execute("ALTER TABLE `tn_company` ADD COLUMN `website` VARCHAR(255) NULL AFTER `logo`; ");
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180408_094758_field_ws cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180408_094758_field_ws cannot be reverted.\n";

        return false;
    }
    */
}
