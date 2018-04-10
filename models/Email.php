<?php
/**
 * Created by Tona Nguyễn
 * Date: 1/29/2018
 * Time: 5:32 PM
 */

namespace app\models;


use PHPMailer\PHPMailer\PHPMailer;
use yii\db\Exception;

/**
 * Class Email
 * @package app\models
 *
 * Tona DOC:
 * Setting gmail become mailserver: https://myaccount.google.com/u/1/apppasswords?rapt=AEjHL4O3T2Xk2UwwABN-Ca9GaqNigTxOSJhaTVOmee4otcVVKU65s9SflsgQRpoKde55TnFXjqZfvJHxvULa4uVQAKkWEMis_A
 * + Create new password for account https://support.google.com/accounts/answer/185833
 * Ex: vanvan.vt88@gmail.com / anwizqatmdosqwlt
 */
class Email
{
    public static function sendMail($subject = 'Subject', $body){
	    $mail = new PHPMailer();                              // Passing `true` enables exceptions
	    try {
		    $mail->SMTPDebug = 0;
	        if(YII_DEBUG){
                //Server settings
                $mail->SMTPDebug = 1;
            }
            // Enable verbose debug output
		    $mail->isSMTP();                                      // Set mailer to use SMTP
		    $mail->Host = 'mail.vina-jobs.com';  // Specify main and backup SMTP servers
		    $mail->SMTPAuth = true;                               // Enable SMTP authentication
		    $mail->Username = 'system@vina-jobs.com';                 // SMTP username
		    $mail->Password = '12345678090';                           // SMTP password
		    $mail->SMTPSecure = 'TLS';                            // Enable TLS encryption, `ssl` also accepted
		    $mail->Port = 25;                                    // TCP port to connect to

		    //Recipients
		    $mail->setFrom('system@vina-jobs.com', 'Viet Nam Jobs');
		    $mail->addAddress('nguyennguyen.vt88@gmail.com', 'Joe User');     // Add a recipient
//		    $mail->addAddress('admin@vina-jobs.com');               // Name is optional
		    $mail->addReplyTo('noreply@vina-jobs.com', 'noreply ');
//		    $mail->addCC('cc@example.com');
//		    $mail->addBCC('bcc@example.com');

		    //Attachments
//		    $mail->addAttachment('/var/tmp/file.tar.gz');         // Add attachments
//		    $mail->addAttachment('/tmp/image.jpg', 'new.jpg');    // Optional name

		    //Content
		    $mail->isHTML(true);                                  // Set email format to HTML
		    $mail->Subject = $subject;
		    $mail->Body    = $body;
		    $mail->AltBody = $body;

		    $mail->send();
		    return true;
	    } catch (\PHPMailer\PHPMailer\Exception $e) {
		    echo 'Message could not be sent. Mailer Error: ', $mail->ErrorInfo;
	    }
    }

    public static function body(){

    }
}