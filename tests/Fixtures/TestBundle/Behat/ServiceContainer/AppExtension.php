<?php

/*
 * This file is part of the API Platform project.
 *
 * (c) Kévin Dunglas <dunglas@gmail.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

declare(strict_types=1);

namespace ApiPlatform\Core\Tests\Fixtures\TestBundle\Behat\ServiceContainer;

use ApiPlatform\Core\Tests\Fixtures\TestBundle\Behat\Listener\RebootKernelListener;
use Behat\Symfony2Extension\ServiceContainer\Symfony2Extension;
use Behat\Testwork\EventDispatcher\ServiceContainer\EventDispatcherExtension;
use Behat\Testwork\ServiceContainer\Extension as ExtensionInterface;
use Behat\Testwork\ServiceContainer\ExtensionManager;
use Symfony\Component\Config\Definition\Builder\ArrayNodeDefinition;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\DependencyInjection\Definition;
use Symfony\Component\DependencyInjection\Reference;

final class AppExtension implements ExtensionInterface
{
    /**
     * {@inheritdoc}
     */
    public function getConfigKey(): string
    {
        return 'app';
    }

    /**
     * {@inheritdoc}
     */
    public function initialize(ExtensionManager $extensionManager): void
    {
    }

    /**
     * {@inheritdoc}
     */
    public function configure(ArrayNodeDefinition $builder): void
    {
    }

    /**
     * {@inheritdoc}
     */
    public function load(ContainerBuilder $container, array $config): void
    {
        $this->loadListeners($container);

        // prevent rebooting kernel after each scenario, as we use feature-level isolation instead
        $kernelAwareContextInitializerDefinition = $container->getDefinition('symfony2_extension.context_initializer.kernel_aware');
        $kernelAwareContextInitializerDefinition->clearTag(EventDispatcherExtension::SUBSCRIBER_TAG);
    }

    /**
     * {@inheritdoc}
     */
    public function process(ContainerBuilder $container): void
    {
    }

    private function loadListeners(COntainerBuilder $container): void
    {
        $rebootKernelListenerDefinition = new Definition(RebootKernelListener::class, [
            new Reference(Symfony2Extension::KERNEL_ID),
        ]);
        $rebootKernelListenerDefinition->addTag(EventDispatcherExtension::SUBSCRIBER_TAG, ['priority' => 0]);
        $container->setDefinition('app_extension.listener.reboot_kernel', $rebootKernelListenerDefinition);
    }
}
