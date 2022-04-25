<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20220425040210 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
		$this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');
        $this->addSql('CREATE TABLE artists_types (id INT AUTO_INCREMENT NOT NULL, artist_id INT NOT NULL, type_id INT NOT NULL, INDEX IDX_29173A3AB7970CF8 (artist_id), INDEX IDX_29173A3AC54C8C93 (type_id), UNIQUE INDEX artist_type_idx (artist_id, type_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE artists_types ADD CONSTRAINT FK_29173A3AB7970CF8 FOREIGN KEY (artist_id) REFERENCES artists (id)');
        $this->addSql('ALTER TABLE artists_types ADD CONSTRAINT FK_29173A3AC54C8C93 FOREIGN KEY (type_id) REFERENCES types (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
		$this->abortIf($this->connection->getDatabasePlatform()->getName() !== 'mysql', 'Migration can only be executed safely on \'mysql\'.');
        $this->addSql('DROP TABLE artists_types');
    }
}
