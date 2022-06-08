<?php

namespace App\Entity;

use App\Repository\UsersRepository;
use App\Repository\RolesRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\Validator\Constraints as Assert;
/**
 * @ORM\Entity(repositoryClass=UsersRepository::class)
  * @ORM\Table(name="users")
 * @UniqueEntity(
 *      fields="username",
 *      message="This username is already taken."
 * )
 * @UniqueEntity(
 *      fields="email",
 *      message="This email is already taken."
 * )

 */
class Users implements UserInterface 
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\Column(type="string", unique=true)
     * @Assert\NotBlank()
     * @Assert\Length(min=2, max=50)
     */
    private $username;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $password;

    /**
     * @ORM\Column(type="string", length=60)
     */
    private $firstname;

    /**
     * @ORM\Column(type="string", length=60)
     */
    private $lastname;

    /**
     * @ORM\Column(type="string", length=100, unique=true)
     */
    private $email;

    /**
     * @ORM\Column(type="string", length=2)
     */
    private $langue;

    /**
     * @ORM\ManyToMany(targetEntity=Roles::class, inversedBy="users")
	 * @ORM\JoinTable(name="users_roles")
	 * joinColumns={@ORM\JoinColumn(name="users_id", referencedColumnName="id")},
     * inverseJoinColumns={@ORM\JoinColumn(name="roles_id", referencedColumnName="id")}
     */
    private $roles = [];

    /**
     * @ORM\OneToMany(targetEntity=RepresentationsUsers::class, mappedBy="users", orphanRemoval=true)
     */
    private $usersrepresentations;

    public function __construct()
    {
        $this->roles = new ArrayCollection();
        $this->usersrepresentations = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

     public function getUsername(): string
    {
        return $this->username;
    }
	
	public function setUsername(string $username): void
                   {
                       $this->username = $username;
                   }


    public function getPassword(): ?string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
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

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getLangue(): ?string
    {
        return $this->langue;
    }

    public function setLangue(string $langue): self
    {
        $this->langue = $langue;

        return $this;
    }

    /**
	 * @see UserInterface
     */
    public function getRoles(): array
    {
         $roles = $this->roles;
		 
		   // il est obligatoire d'avoir au moins un rôle si on est authentifié, par convention c'est ROLE_MEMBER
        if (empty($roles)) {
			 
			 $roles[]='ROLE_MEMBER';
             addRole( $roles);
        }  
		 else {
		   $roles = $roles->toArray();
          foreach ($roles as &$role) {
            $role = $role->getRole();
        }
        unset($role);
		}	
      
        

        return array_unique($roles); 
    }

    public function setRoles(array $roles): void
    {    
	    
        $this->roles = $roles;
    }
	
    public function addRole(Roles $role): self
    {
        if (!$this->roles->contains($role)) {
            $this->roles[] = $role;
        }

        return $this;
    }

    public function removeRole(Roles $role): self
    {
        $this->roles->removeElement($role);

        return $this;
    }

    /**
     * @return Collection<int, RepresentationsUsers>
     */
    public function getUsersrepresentations(): Collection
    {
        return $this->usersrepresentations;
    }

    public function addUsersrepresentation(RepresentationsUsers $usersrepresentation): self
    {
        if (!$this->usersrepresentations->contains($usersrepresentation)) {
            $this->usersrepresentations[] = $usersrepresentation;
            $usersrepresentation->setUsers($this);
        }

        return $this;
    }

    public function removeUsersrepresentation(RepresentationsUsers $usersrepresentation): self
    {
        if ($this->usersrepresentations->removeElement($usersrepresentation)) {
            // set the owning side to null (unless already changed)
            if ($usersrepresentation->getUsers() === $this) {
                $usersrepresentation->setUsers(null);
            }
        }

        return $this;
    }
	 public function getSalt(): ?string
    {
        return null;
    }

    public function eraseCredentials(): void
    {
    }
	
}
