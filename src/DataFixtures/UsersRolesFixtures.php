<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Doctrine\Common\DataFixtures\DependentFixtureInterface;
class UsersRolesFixtures extends Fixture implements DependentFixtureInterface
{
    public function load(ObjectManager $manager): void
    {
        // $product = new Product();
        // $manager->persist($product);
        $usersroles = [
            [
                'firstname'=>'bob',
                'lastname'=>'Dylan',
                'role'=>'ROLE_ADMIN',
            ],
            [
                'firstname'=>'fred',
                'lastname'=>'Mercuri',
                'role'=>'ROLE_MEMBER',
            ],
            [
                'firstname'=>'stef',
                'lastname'=>'Kapond',
                'role'=>'ROLE_AFFILIATE',
            ],
			
                ];
        
        foreach ($usersroles as $record) {
            //Récupérer l'artiste (entité principale)
            $user = $this->getReference(
                $record['firstname'].'-'.$record['lastname']
            );
            
            //Récupérer le type (entité secondaire)
            $role = $this->getReference($record['role']);
            
            //Définir son type
            $user->addRole($role);
            
            //Persister l'entité principale
            $manager->persist($user);            
        }

        $manager->flush();
    }
	    public function getDependencies() {
        return [
            UsersFixtures::class,
            RolesFixtures::class,
        ];
    }

}
