<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class Company extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */

    public $subject;
    public $body;
    public $from_user;
    public $name;

    public function __construct($name,$from_user,$subject,$body)
    {
        //
        $this->name = $name;
        $this->from_user = $from_user;
        $this->subject = $subject;
        $this->body = $body;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from('info@lixnet.net', 'Pension System')
                    ->subject($this->subject)
                    ->view('mail.notification');
    }
}
