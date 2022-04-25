<?php

namespace App\Entity;

use App\Repository\TypesRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=TypesRepository::class)
 * @ORM\Table(name="types")
 */
class Types
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", length=60)
     */
    private $type;

    /**
     * @ORM\OneToMany(targetEntity=ArtistsTypes::class, mappedBy="type", orphanRemoval=true)
     */
    private $artists;

    public function __construct()
    {
        $this->artists = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getType(): ?string
    {
        return $this->type;
    }

    public function setType(string $type): self
    {
        $this->type = $type;

        return $this;
    }

    /**
     * @return Collection<int, ArtistsTypes>
     */
    public function getArtists(): Collection
    {
        return $this->artists;
    }

    public function addArtist(ArtistsTypes $artist): self
    {
        if (!$this->artists->contains($artist)) {
            $this->artists[] = $artist;
            $artist->setType($this);
        }

        return $this;
    }

    public function removeArtist(ArtistsTypes $artist): self
    {
        if ($this->artists->removeElement($artist)) {
            // set the owning side to null (unless already changed)
            if ($artist->getType() === $this) {
                $artist->setType(null);
            }
        }

        return $this;
    }
}
