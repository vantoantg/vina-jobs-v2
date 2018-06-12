<?php

use yii\db\Migration;

/**
 * Class m180401_144940_delete_user
 */
class m180401_144940_delete_user extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {
        $this->execute("DELETE FROM `tn_user` WHERE id > 1;
		DELETE FROM `tn_user_details` WHERE user_id > 1;");
    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m180401_144940_delete_user cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180401_144940_delete_user cannot be reverted.\n";

        return false;
    }
    */
}
