<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220424070803 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
		$this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');
        $this->addSql('CREATE TABLE representationsusers (id INT AUTO_INCREMENT NOT NULL, representations_id INT NOT NULL, users_id INT NOT NULL, places VARCHAR(11) NOT NULL, INDEX IDX_BA4CF5F75DE745A2 (representations_id), INDEX IDX_BA4CF5F767B3B43D (users_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE representationsusers ADD CONSTRAINT FK_BA4CF5F75DE745A2 FOREIGN KEY (representations_id) REFERENCES representations (id) ON DELETE RESTRICT');
        $this->addSql('ALTER TABLE representationsusers ADD CONSTRAINT FK_BA4CF5F767B3B43D FOREIGN KEY (users_id) REFERENCES users (id) ON DELETE RESTRICT');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
		$this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');
        $this->addSql('DROP TABLE representationsusers');
    }
}
