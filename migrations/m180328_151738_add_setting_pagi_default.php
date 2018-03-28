<?php

use yii\db\Migration;

/**
 * Class m180328_151738_add_setting_pagi_default
 */
class m180328_151738_add_setting_pagi_default extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
		$this->execute("INSERT INTO `tn_setting` (`name`, `code`, `value`, `default`) VALUES ('Default pagination', 'page_size', '15', '10'); ");
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180328_151738_add_setting_pagi_default cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180328_151738_add_setting_pagi_default cannot be reverted.\n";

        return false;
    }
    */
}
