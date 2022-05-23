<?php

namespace App\Entity;

use App\Repository\RolesRepository;
use App\Repository\UsersRepository;
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
     * @ORM\Column(type="string", length=180, unique=true)
     */
    private $email;

    /**
     * @ORM\ManyToMany(targetEntity=Roles::class, inversedBy="users")
     * @ORM\JoinTable(name="users_roles")
     */
    private $roles = [];

    /**
     * @ORM\OneToMany(targetEntity=RepresentationsUsers::class, mappedBy="users", orphanRemoval=true)
     */
    private $usersrepresentations;


    /**
     * @var string The hashed password
     * @ORM\Column(type="string")
     */
    private $password;

    public function __construct()
    {
        $this->roles = new ArrayCollection();
        $this->usersrepresentations = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
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

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUserIdentifier(): string
    {
        return (string) $this->email;
    }

    /**
     * @deprecated since Symfony 5.3, use getUserIdentifier instead
     */
    public function getUsername(): string
    {
        return (string) $this->email;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array
    {
        $roles = $this->roles;

        if(empty($roles)){
            $roles[] ='ROLE_MEMBER';
        }

        $roles = $roles->toArray();

        foreach ($roles as &$role) {
            $role = $role->getRole();
        }
        unset($role);

        // guarantee every user at least has ROLE_MEMBER
        /*$roles[] = 'ROLE_MEMBER';

        $roles = [
            'ROLE_ADMIN',
            'ROLE_MEMBER',
        ];*/

//dd($roles->toArray());
        return array_unique($roles); 
    }

    public function addRole(Roles $role): self
    {
        if (!$this->roles->contains($role)) {
            $this->roles[] = $role;
            //$role->addUser($this);
        }

        return $this;
    }

    public function removeRole(Roles $role): self
    {
        if ($this->roles->removeElement($role)) {
            //$role->removeUser($this);
        }

        return $this;
    }

    /**
     * @see PasswordAuthenticatedUserInterface
     */
    public function getPassword(): string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }

    /**
     * Returning a salt is only needed, if you are not using a modern
     * hashing algorithm (e.g. bcrypt or sodium) in your security.yaml.
     *
     * @see UserInterface
     */

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

    /**
     * @see UserInterface
     */
    public function eraseCredentials()
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
    }
}
