<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use App\Entity\Roles;

class RolesFixtures extends Fixture
{
    public function load(ObjectManager $manager): void
    {
        // $product = new Product();
        // $manager->persist($product);

        $roles=[
		    ['role'=>'"ROLE_ADMIN"'],
            ['role'=>'"ROLE_MEMBER"'],
			['role'=>'"ROLE_AFFILIATE"']
	];
        foreach ($roles as $record) {
            $role = new Roles();
            $role->setRole($record['role']);
            
            $manager->persist($role);
			$this->addReference($record['role'],$role);
        }
         
            
        $manager->flush();
    }
}
