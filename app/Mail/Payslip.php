<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class Payslip extends Mailable
{
    use Queueable, SerializesModels;

    /**
     * Create a new message instance.
     *
     * @return void
     */

    public $fperiod;
    public $user;
    public $file;

    public function __construct($fperiod,$user,$file)
    {
        //
        $this->fperiod = $fperiod;
        $this->user = $user;
        $this->file = $file;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from('info@lixnet.net', 'Pension System')
                    ->subject('Payslip')
                    ->view('payslips.message')
                    ->attach($this->file);
    }
}
