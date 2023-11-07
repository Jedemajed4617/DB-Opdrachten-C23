-- Opdracht 01 - db user

-- Maak de nieuwe gebruiker "persoonsitereadonly" aan met een wachtwoord:
CREATE USER 'persoonsitereadonly'@'localhost' IDENTIFIED BY 'jouw_wachtwoord';

-- Kies het schema dat je hebt gemaakt met eerdere opdrachten (bijvoorbeeld "myapp_schema")
-- en verleen de gebruiker alleen leesrechten (SELECT-rechten) op dat schema:
GRANT SELECT ON myapp_schema.* TO 'persoonsitereadonly'@'localhost';

FLUSH PRIVILEGES; -- Laad de nieuwe gebruikersrechten