<?php

namespace App\Entity;

use App\Repository\RepresentationsRepository;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\JoinColumn;
/**
 * @ORM\Entity(repositoryClass=RepresentationsRepository::class)
 * @ORM\Table(name="representations")
 */
class Representations
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Shows::class, inversedBy="representations")
     * @ORM\JoinColumn(nullable=false, name="show_id", referencedColumnName="id", onDelete="RESTRICT")
     */
    private $the_show;

    /**
     * @ORM\Column(type="datetime")
     */
    private $schedule;

    /**
     * @ORM\ManyToOne(targetEntity=Locations::class, inversedBy="representations")
	 * @ORM\JoinColumn(name="location_id", referencedColumnName="id", onDelete="RESTRICT") 
     */
    private $the_location;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getTheShow(): ?Shows
    {
        return $this->the_show;
    }

    public function setTheShow(?Shows $the_show): self
    {
        $this->the_show = $the_show;

        return $this;
    }

    public function getSchedule(): ?\DateTimeInterface
    {
        return $this->schedule;
    }

    public function setSchedule(\DateTimeInterface $schedule): self
    {
        $this->schedule = $schedule;

        return $this;
    }

    public function getTheLocation(): ?Locations
    {
        return $this->the_location;
    }

    public function setTheLocation(?Locations $the_location): self
    {
        $this->the_location = $the_location;

        return $this;
    }
}
