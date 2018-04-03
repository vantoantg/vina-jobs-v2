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
 * Ex: vanvan.vt88@gmail.com / jkwdqrpqozpdhgqw
 */
class Email
{
    public static function sendMail($subject = 'Subject', $body){
	    $mail = new PHPMailer();                              // Passing `true` enables exceptions
	    try {
		    //Server settings
//		    $mail->SMTPDebug = 1;                                 // Enable verbose debug output
		    $mail->isSMTP();                                      // Set mailer to use SMTP
		    $mail->Host = 'smtp.gmail.com';  // Specify main and backup SMTP servers
		    $mail->SMTPAuth = true;                               // Enable SMTP authentication
		    $mail->Username = 'vanvan.vt88@gmail.com';                 // SMTP username
		    $mail->Password = 'jkwdqrpqozpdhgqw';                           // SMTP password
		    $mail->SMTPSecure = 'ssl';                            // Enable TLS encryption, `ssl` also accepted
		    $mail->Port = 465;                                    // TCP port to connect to

		    //Recipients
		    $mail->setFrom('vanvan.vt88@gmail.com', 'http://www.vina-jobs.com');
		    $mail->addAddress('nguyennguyen.vt88@gmail.com', 'Joe User');     // Add a recipient
//		    $mail->addAddress('admin@vina-jobs.com');               // Name is optional
		    $mail->addReplyTo('nguyennguyen.vt88@gmail.com', 'Vina-jobs.com');
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