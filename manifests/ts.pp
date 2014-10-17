# ts.pp
define ts($command = $title)
  exec { $command:
    command => "echo $command",
    user => $userName,
  }
}