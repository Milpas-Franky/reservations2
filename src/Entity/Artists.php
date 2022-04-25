<?php

namespace App\Entity;

use App\Repository\ArtistsRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ArtistsRepository::class)
 * @ORM\Table(name="artists")
 */
class Artists
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
    private $firstname;

    /**
     * @ORM\Column(type="string", length=60)
     */
    private $lastname;

    /**
     * @ORM\OneToMany(targetEntity=ArtistsTypes::class, mappedBy="artist", orphanRemoval=true)
     */
    private $types;

    public function __construct()
    {
        $this->types = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getFirstname(): ?string
    {
        return $this->firstname;
    }

    public function setFirstname(string $firstname): self
    {
        $this->firstname = $firstname;

        return $this;
    }

    public function getLastname(): ?string
    {
        return $this->lastname;
    }

    public function setLastname(string $lastname): self
    {
        $this->lastname = $lastname;

        return $this;
    }

    /**
     * @return Collection<int, ArtistsTypes>
     */
    public function getTypes(): Collection
    {
        return $this->types;
    }

    public function addType(ArtistsTypes $type): self
    {
        if (!$this->types->contains($type)) {
            $this->types[] = $type;
            $type->setArtist($this);
        }

        return $this;
    }

    public function removeType(ArtistsTypes $type): self
    {
        if ($this->types->removeElement($type)) {
            // set the owning side to null (unless already changed)
            if ($type->getArtist() === $this) {
                $type->setArtist(null);
            }
        }

        return $this;
    }
}
