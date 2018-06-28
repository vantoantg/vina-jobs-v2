<?php

/*
 *  Created by Tona Nguyen
 *  Email: nguyennguyen.vt88@gmail.com
 *  Phone: 0932.252.414
 *  Address: VN, HCMC
 *  Website: https://jobsvina.com/
 */

namespace app\models;

use app\library\helper\Helper;
use PHPMailer\PHPMailer\PHPMailer;
use yii\base\Model;

/**
 * Class Email
 */
class Email extends Model
{
    /**
     * @param string $subject
     * @param $body
     * @param string $toEmail
     * @param string $toName
     *
     * @return bool
     */
    public static function sendMail(
        $subject = 'Subject',
        $body,
        $toEmail = 'nguyennguyen.vt88@gmail.com',
        $toName = 'Tona Nguyễn'
    ) {
        $mail = new PHPMailer();                              // Passing `true` enables exceptions
        try {
            $m = \Yii::$app->params['mail'];
            $mail->SMTPDebug = 0;
            if (YII_DEBUG) {
                //Server settings
                $mail->SMTPDebug = 1;
            }
            // Enable verbose debug output
            $mail->isSMTP();                                      // Set mailer to use SMTP
            $mail->Host = $m['host'];  // Specify main and backup SMTP servers
            $mail->SMTPAuth = true;                               // Enable SMTP authentication
            $mail->Username = $m['username'];                 // SMTP username
            $mail->Password = $m['password'];                           // SMTP password
            $mail->SMTPSecure = $m['secure'];                            // Enable TLS encryption, `ssl` also accepted
            $mail->Port = $m['port'];                                    // TCP port to connect to

            //Recipients
            $mail->setFrom($m['options']['setFrom'], \Yii::$app->params['siteName']);
            $mail->addAddress($toEmail, $toName);     // Add a recipient
            //		    $mail->addAddress('admin@vina-jobs.com');               // Name is optional
            $mail->addReplyTo($m['options']['addReplyTo'], 'noreply');
            $mail->addCC(Helper::getInstance()->params('adminEmail'));
            //		    $mail->addBCC('bcc@example.com');

            //Attachments
            //		    $mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
            //		    $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

            //Content
            $mail->isHTML(true);                                  // Set email format to HTML
            $mail->Subject = $subject;
            $mail->Body = $body;
            $mail->AltBody = $body;

            $mail->send();

            return true;
        } catch (\PHPMailer\PHPMailer\Exception $e) {
            echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
        }
    }

    public static function sendMailApply($subject = 'Apply', $body, $toEmail = '', $toName = '', $attachment = false)
    {
        $mail = new PHPMailer();                              // Passing `true` enables exceptions
        try {
            $m = \Yii::$app->params['mail'];
            $mail->SMTPDebug = 0;
            if (YII_DEBUG) {
                $mail->SMTPDebug = 1;
            }
            $mail->isSMTP();                                      // Set mailer to use SMTP
            $mail->Host = $m['host'];  // Specify main and backup SMTP servers
            $mail->SMTPAuth = true;                               // Enable SMTP authentication
            $mail->Username = $m['username'];                 // SMTP username
            $mail->Password = $m['password'];                           // SMTP password
            $mail->SMTPSecure = $m['secure'];                            // Enable TLS encryption, `ssl` also accepted
            $mail->Port = $m['port'];                                    // TCP port to connect to

            //Recipients
            $mail->setFrom($m['options']['setFrom'], \Yii::$app->params['siteName']);
            $mail->addAddress($toEmail, $toName);     // Add a recipient
            //		    $mail->addAddress('admin@vina-jobs.com');               // Name is optional
            $mail->addReplyTo($m['options']['addReplyTo'], 'noreply');
            $mail->addCC(Helper::getInstance()->params('adminEmail'), 'Tona Nguyen - Noti');
            //		    $mail->addBCC('bcc@example.com');

            //Attachments
            if ($attachment) {
                $mail->addAttachment($attachment);         // Add attachments /var/tmp/file.tar.gz
            }

            //Content
            $mail->isHTML(true);                                  // Set email format to HTML
            $mail->Subject = $subject;
            $mail->Body = $body;
            $mail->AltBody = $body;

            $mail->send();

            return true;
        } catch (\PHPMailer\PHPMailer\Exception $e) {
            echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
        }
    }

    public function sendContact($body)
    {
        $mail = new PHPMailer();                              // Passing `true` enables exceptions
        try {
            $m = \Yii::$app->params['mail'];
            $mail->SMTPDebug = 0;
            if (YII_DEBUG) {
                //Server settings
                $mail->SMTPDebug = 1;
            }
            // Enable verbose debug output
            $mail->isSMTP();                                      // Set mailer to use SMTP
            $mail->Host = $m['host'];  // Specify main and backup SMTP servers
            $mail->SMTPAuth = true;                               // Enable SMTP authentication
            $mail->Username = $m['username'];                 // SMTP username
            $mail->Password = $m['password'];                           // SMTP password
            $mail->SMTPSecure = $m['secure'];                            // Enable TLS encryption, `ssl` also accepted
            $mail->Port = $m['port'];                                    // TCP port to connect to

            //Recipients
            $mail->setFrom($m['options']['setFrom'], \Yii::$app->params['siteName']);
            $mail->addAddress(Helper::getInstance()->params('adminEmail'), 'System - '.Helper::getInstance()->params());     // Add a recipient
            //		    $mail->addAddress('admin@vina-jobs.com');               // Name is optional
            $mail->addReplyTo($m['options']['addReplyTo'], 'noreply');
            $mail->addCC(Helper::getInstance()->params('adminEmail'));
            //		    $mail->addBCC('bcc@example.com');

            //Attachments
            //		    $mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
            //		    $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

            //Content
            $mail->isHTML(true);                                  // Set email format to HTML
            $mail->Subject = 'Contact from '.Helper::getInstance()->params();
            $mail->Body = $body;
            $mail->AltBody = $body;

            $mail->send();

            return true;
        } catch (\PHPMailer\PHPMailer\Exception $e) {
            echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
        }
    }

    public static function sendNotiCandidateRegister($subject, $body)
    {
        $mail = new PHPMailer();                              // Passing `true` enables exceptions
        try {
            $m = \Yii::$app->params['mail'];
            $mail->SMTPDebug = 0;
            if (YII_DEBUG) {
                $mail->SMTPDebug = 1;
            }
            // Enable verbose debug output
            $mail->isSMTP();                                      // Set mailer to use SMTP
            $mail->Host = $m['host'];  // Specify main and backup SMTP servers
            $mail->SMTPAuth = true;                               // Enable SMTP authentication
            $mail->Username = $m['username'];                 // SMTP username
            $mail->Password = $m['password'];                           // SMTP password
            $mail->SMTPSecure = $m['secure'];                            // Enable TLS encryption, `ssl` also accepted
            $mail->Port = $m['port'];                                    // TCP port to connect to

            //Recipients
            $mail->setFrom($m['options']['setFrom'], \Yii::$app->params['siteName']);
            $mail->addAddress(Helper::getInstance()->params('adminEmail'), 'System - '.Helper::getInstance()->params());     // Add a recipient
            //		    $mail->addAddress('admin@vina-jobs.com');               // Name is optional
            $mail->addReplyTo($m['options']['addReplyTo'], 'noreply');
            $mail->addCC(Helper::getInstance()->params('adminEmail'));
            //		    $mail->addBCC('bcc@example.com');

            //Content
            $mail->isHTML(true);                                  // Set email format to HTML
            $mail->Subject = $subject;
            $mail->Body = $body;
            $mail->AltBody = $body;

            $mail->send();

            return true;
        } catch (\PHPMailer\PHPMailer\Exception $e) {
            echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
        }
    }

    public function validateRmailType()
    {
    }

    public static function body()
    {
    }
}
