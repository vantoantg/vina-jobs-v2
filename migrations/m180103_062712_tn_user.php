<?php

use yii\db\Migration;

/**
 * Class m180103_062712_tn_user
 */
class m180103_062712_tn_user extends Migration
{
    /**
     * @inheritdoc
     */
    public function safeUp()
    {
    }

    /**
     * @inheritdoc
     */
    public function safeDown()
    {
        echo "m180103_062712_tn_user cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m180103_062712_tn_user cannot be reverted.\n";

        return false;
    }
    */
}
