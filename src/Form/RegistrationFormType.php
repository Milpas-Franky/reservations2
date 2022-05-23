<?php

namespace App\Form;

use App\Entity\Users;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\EmailType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\IsTrue;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;

class RegistrationFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('email', EmailType::class)
            ->add('firstname', TextType::class)
            ->add('lastname', TextType::class)
            ->add('langue', TextType::class)
            ->add('roles')
            ->add('username', TextType::class,[
                'constraints'=>[
                    new Length([
                        'min' => 2,
                        'minMessage' => 'Votre nom d\'utilisateur doit contenir au moins {{ limit }} caractères.',
                    ]),
                ],

                ])

            ->add('plainPassword', PasswordType::class, [
                //instead of being set into the object directly,
                // this is read and encoded in the controller
                'mapped' => false,
                'constraints'=>[
                    new NotBlank([
                        'message' => 'Veuillez saisir un mot de passe valide.', 
                    ]),
                    new Length([
                        'min' => 6, 
                        'minMessage' => 'Votre mot de passe doit contenir au moins {{ limit }} caractères.', 
                        // max length allowed by Symfony for security reasons
                        'max' => 4096, 
                    ]),
                ],
            ]);
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Users::class,
        ]);
    }
	/**
	 */
	function __construct() {
	}
}
