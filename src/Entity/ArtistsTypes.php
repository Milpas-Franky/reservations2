<?php

namespace App\Entity;

use App\Repository\ArtistsTypesRepository;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\UniqueConstraint;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
 * @ORM\Entity(repositoryClass=ArtistsTypesRepository::class)
  *  @ORM\Table(name="artists_types",uniqueConstraints={
 *       @UniqueConstraint(name="artist_type_idx", columns={"artist_id", "type_id"})})
 * @UniqueEntity(
 *      fields={"artist","type"},
 *      message="This artist is already defined for this type of job in the database."
 * )

 */
class ArtistsTypes
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Artists::class, inversedBy="types")
     * @ORM\JoinColumn(nullable=false)
     */
    private $artist;

    /**
     * @ORM\ManyToOne(targetEntity=Types::class, inversedBy="artists")
     * @ORM\JoinColumn(nullable=false)
     */
    private $type;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getArtist(): ?Artists
    {
        return $this->artist;
    }

    public function setArtist(?Artists $artist): self
    {
        $this->artist = $artist;

        return $this;
    }

    public function getType(): ?Types
    {
        return $this->type;
    }

    public function setType(?Types $type): self
    {
        $this->type = $type;

        return $this;
    }
}
